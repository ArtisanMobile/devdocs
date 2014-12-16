#!/bin/bash
USAGE="sdk_release.sh -h [Help] -v <New Version Number (i.e. 0.0.5)> -a (if Android)"

get_api_docs() {
  VERSION=$1
  IS_ANDROID=$2

  UNDERSCORE_VERSION=`echo ${VERSION} | tr . _`

  if [ ${IS_ANDROID} ]; then
    DOCFOLDER="com.artisan.ArtisanSDK.javadocs"
    DOCNAME="${DOCFOLDER}.${VERSION}.tar.gz"
    DOCURL="http://artisan-android-release.s3.amazonaws.com/${DOCNAME}"

    DOCPATH="/android/javadoc/${UNDERSCORE_VERSION}"
    HUBFILE="./_posts/2014-05-08-javadocs.md"
  else
    DOCFOLDER="com.apprenaissance.ArtisanSDK.docset.html"
    DOCNAME="${DOCFOLDER}.${VERSION}.tar.gz"
    DOCURL="http://artisan-releases.s3.amazonaws.com/${DOCNAME}"

    DOCPATH="/ios/appledoc/${UNDERSCORE_VERSION}"
    HUBFILE="./_posts/2014-05-09-appledocs.md"
  fi

  # Create a new home for the documentation download.
  mkdir ./${DOCPATH}

  # Download the documentation, unpack it, and copy it to the correct spot.
  wget ${DOCURL}
  tar -zxvf ${DOCNAME}
  cp -r ./${DOCFOLDER}/* ./${DOCPATH}

  # Clean up the downloads
  rm -rf ${DOCNAME}
  rm -rf ${DOCFOLDER}

  # Add the link to the appropriate doc hub site
  LINK_LINE="* <a target=\"_blank\" href=\"${DOCPATH}\">${VERSION}</a>"

  awk -v "var=${LINK_LINE}" '/.*_blank.*/ && !x {print var; x=1} 1' ${HUBFILE} > ${HUBFILE}_tmp
  mv ${HUBFILE}_tmp ${HUBFILE}
}

create_release_notes() {
  VERSION=$1
  IS_ANDROID=$2

  DASH_VERSION=`echo ${VERSION} | tr . -`
  TEMPLATE_FILE='./templates/release_notes.md'

  if [ ${IS_ANDROID} ]; then
    NOTES_PATH="`date +%Y-%m-%d`-android-release-${DASH_VERSION}.md"
    TITLE_STRING="Android ${VERSION} Release Notes"
  else
    NOTES_PATH="`date +%Y-%m-%d`-ios-release-${DASH_VERSION}.md"
    TITLE_STRING="iOS ${VERSION} Release Notes"
  fi

  # Copy the template file and substitute in the correct title and header.
  cp ${TEMPLATE_FILE} ${NOTES_PATH}
  sed -i "" "s/title\: \"\"/title\: ${TITLE_STRING}/g" ${NOTES_PATH}
  sed -i "" "s/\# SDK Release Notes/\# ${TITLE_STRING}/g" ${NOTES_PATH}

  mv ${NOTES_PATH} _posts/${NOTES_PATH}
}

if [ $# -lt 1 ]; then
  echo $USAGE; exit 1
fi

while getopts "hv:a" opt;
  do
    case $opt in
    h) echo $USAGE; ;;

    v) version=$OPTARG; ;;

    a) is_android=true; ;;

    *) echo $USAGE; exit 1 ;;
    esac
  done

if [ -n "$version" ]; then
  get_api_docs $version $is_android;
  create_release_notes $version $is_android;
fi
