# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-planningpoker

#CONFIG += sailfishapp
# Start of temporary fix for the icon for the Nov 2013 harbour requirements
# QML files and folders
QT += quick qml
CONFIG += link_pkgconfig
PKGCONFIG += sailfishapp
INCLUDEPATH += /usr/include/sailfishapp

TARGETPATH = /usr/bin
target.path = $$TARGETPATH

DEPLOYMENT_PATH = /usr/share/$$TARGET
qml.files = qml
qml.path = $$DEPLOYMENT_PATH

desktop.files = harbour-planningpoker.desktop
desktop.path = /usr/share/applications

icon.files = harbour-planningpoker.png
icon.path = /usr/share/icons/hicolor/86x86/apps

# moving mixpanel to harbour.wikipedia.Mixpanel location to satisfy new harbour requirements
# qml.files/path will deploy a copy to the old location, but it's ok, it's not going to be used
mixpanel.files = qml/components/Mixpanel/src/Mixpanel
mixpanel.path = $$DEPLOYMENT_PATH/qml/components/harbour/planningpoker

INSTALLS += target icon desktop mixpanel qml
# End of nov 2013 fix

SOURCES += src/harbour-planningpoker.cpp

OTHER_FILES += qml/harbour-planningpoker.qml \
    qml/pages/FirstPage.qml \
    rpm/harbour-planningpoker.spec \
    rpm/harbour-planningpoker.yaml \
    harbour-planningpoker.desktop \
    qml/pages/InfoPage.qml \
    qml/pages/CardPage.qml \
    qml/pages/Cards.qml \
    qml/pages/CoverPage.qml

