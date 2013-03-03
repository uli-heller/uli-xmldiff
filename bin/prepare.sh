#!/bin/sh
#set -x
D="$(dirname "$0")"
D="$(cd "${D}"; pwd)"

TPD="${D}/../3rd-party"

if [ ! -d "${TPD}" ]; then
  mkdir -p "${TPD}"
fi

#GROOVY_VERSION="2.1.1"
#GROOVY_ZIP_BASENAME="groovy-binary-${GROOVY_VERSION}.zip"
#GROOVY_ZIP_DOWNLOAD_URL="http://dist.groovy.codehaus.org/distributions/${GROOVY_ZIP_BASENAME}"
#GROOVY_ZIP_ABSOLUTE_PATH="${TPD}/${GROOVY_ZIP_BASENAME}"
#
#if [ ! -d "${D}/groovy" ]; then
#  if [ ! -s  "${GROOVY_ZIP_ABSOLUTE_PATH}" ]; then
#    "${D}/httpcat.sh" "${GROOVY_ZIP_DOWNLOAD_URL}" >"${GROOVY_ZIP_ABSOLUTE_PATH}"
#  fi
#  (cd "${D}"; "${D}/myjar.sh" -xf "${GROOVY_ZIP_ABSOLUTE_PATH}")
#  mv "${D}/groovy-${GROOVY_VERSION}" "${D}/groovy"
#  (cd "${D}/groovy/bin"; ls|grep -v "bat"|xargs chmod +x)
#fi

XMLUNIT_VERSION="1.4"
XMLUNIT_BASENAME="xmlunit-${XMLUNIT_VERSION}"
XMLUNIT_ZIP_BASENAME="${XMLUNIT_BASENAME}-bin.zip"
XMLUNIT_JAR_BASENAME="${XMLUNIT_BASENAME}.jar"
XMLUNIT_ZIP_DOWNLOAD_URL="http://netcologne.dl.sourceforge.net/project/xmlunit/xmlunit%20for%20Java/XMLUnit%20for%20Java%201.4/${XMLUNIT_ZIP_BASENAME}"
XMLUNIT_ZIP_ABSOLUTE_PATH="${TPD}/${XMLUNIT_ZIP_BASENAME}"
if [ ! -s  "${XMLUNIT_ZIP_ABSOLUTE_PATH}" ]; then
  "${D}/httpcat.sh" "${XMLUNIT_ZIP_DOWNLOAD_URL}" >"${XMLUNIT_ZIP_ABSOLUTE_PATH}"
fi
if [ ! -d "${D}/../lib" ]; then
  mkdir "${D}/../lib"
fi
if [ ! -s "${D}/../lib/${XMLUNIT_JAR_BASENAME}" ]; then
  (cd "${D}/../lib"; "${D}/myjar.sh" -xf "${XMLUNIT_ZIP_ABSOLUTE_PATH}")
  mv "${D}/../lib/${XMLUNIT_BASENAME}/lib/"*.jar "${D}/../lib/."
  rm -rf "${D}/../lib/${XMLUNIT_BASENAME}"
fi

exit 0
