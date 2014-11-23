#!/bin/bash
USAGE="sdk_release.sh -h [Help] -v <New Version Number (i.e. 0.0.5)> -a (if Android)"

get_api_docs() {
  VERSION=$1
  IS_ANDROID=$2

  if [ ${IS_ANDROID} ]; then
    DOCFOLDER="com.artisan.ArtisanSDK.javadocs"
    DOCNAME="${DOCFOLDER}.${VERSION}.tar.gz"
    DOCURL="http://artisan-android-release.s3.amazonaws.com/${DOCNAME}"

    UNDERSCORE_VERSION=`echo ${VERSION} | tr . _`
    DOCPATH="./android/javadoc/${UNDERSCORE_VERSION}"
  else
    DOCFOLDER="com.apprenaissance.ArtisanSDK.docset.html"
    DOCNAME="${DOCFOLDER}.${VERSION}.tar.gz"
    DOCURL="http://artisan-releases.s3.amazonaws.com/${DOCNAME}"

    UNDERSCORE_VERSION=`echo ${VERSION} | tr . _`
    DOCPATH="./ios/appledoc/${UNDERSCORE_VERSION}"
  fi

  # Create a new home for the documentation download.
  mkdir ${DOCPATH}

  # Download the documentation, unpack it, and copy it to the correct spot.
  wget ${DOCURL}
  tar -zxvf ${DOCNAME}
  cp -r ./${DOCFOLDER}/* ${DOCPATH}

  # Clean up the downloads
  rm -rf ${DOCNAME}
  rm -rf ${DOCFOLDER}
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
fi