#ifndef CONFIGREAD_H
#define CONFIGREAD_H
#include <QFile>
#include <QJsonObject> // { }
#include <QJsonArray> // [ ]
#include <QJsonDocument> // 解析Json
#include <QJsonValue> // int float double bool null { } [ ]
#include <QJsonParseError>
#include <QObject>
#include <QVariantMap>
#include <QStringList>
class ConfigRead : public QObject
{
    Q_OBJECT
    QString filePath = "";

public:
    Q_PROPERTY(QVariantMap configMap READ getConfigMap)
    QVariantMap configMap;
    ConfigRead();

    QString ReadJsonFile();
    void setConfig(QJsonObject);
    Q_INVOKABLE void paserJson();
    Q_INVOKABLE QVariantMap getLycMap(QString fileNme);
    Q_INVOKABLE QVariantMap getConfigMap(){
        return this->configMap;
    }
    Q_INVOKABLE void  setFilePath(QString filePath);

signals:
    void configMapChange();
};

#endif // CONFIGREAD_H
