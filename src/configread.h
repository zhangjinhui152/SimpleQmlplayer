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

class ConfigRead : public QObject
{
    Q_OBJECT


public:
    Q_PROPERTY(QVariantMap configMap READ getConfigMap)
    QVariantMap configMap;
    ConfigRead();

    QString ReadJsonFile();
    Q_INVOKABLE void paserJson();
    void setConfig(QJsonObject);
    Q_INVOKABLE QVariantMap getConfigMap(){
        return this->configMap;
    }
    Q_INVOKABLE QVariantMap getLycMap(QString fileNme);

signals:
    void configMapChange();
};

#endif // CONFIGREAD_H
