#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine>
#include <QQuickView>
#include <QSurfaceFormat>
int main(int argc, char *argv[])
{
    qputenv("QML_DISABLE_DISK_CACHE", "true");
    QApplication app(argc, argv);
    QSurfaceFormat f = QSurfaceFormat::defaultFormat();
    f.setVersion(3, 1);
    f.setProfile(QSurfaceFormat::OpenGLContextProfile::CompatibilityProfile);
    QSurfaceFormat::setDefaultFormat(f);

    QtWebEngine::initialize();

    QQuickView engine(QUrl(QStringLiteral("/Users/jcelerier/pres-scrime-2017-06/Main.qml")));
    engine.setResizeMode(QQuickView::ResizeMode::SizeRootObjectToView);
    engine.show();
    return app.exec();
}
