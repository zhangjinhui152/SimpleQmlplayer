#include "configread.h"

ConfigRead::ConfigRead()
{

}

QString ConfigRead::ReadJsonFile()
{
    QFile file("./config.json");
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    QString value = file.readAll();
    file.close();
    return value;
}

void  ConfigRead::paserJson()
{
    QString jsonData =  ReadJsonFile();
    QJsonParseError parseJsonErr;
    QJsonDocument document = QJsonDocument::fromJson(jsonData.toUtf8(), &parseJsonErr);
    if (! (parseJsonErr.error == QJsonParseError::NoError)) {
        qDebug()<<"THIS IS ERROR void ConfigRead::paserJson()";
        return ;
    }
    QJsonObject jsonObject = document.object();
    setConfig(jsonObject);
}

void ConfigRead::setConfig(QJsonObject configItem)
{
    this->configMap["controls_size"] = configItem["controls_size"].toInt();
    this->configMap["bg_blur_num"] = configItem["bg_blur_num"].toInt();
    this->configMap["bg_blur_effect"] = configItem["bg_blur_effect"].toBool();
    this->configMap["bg_effect_transparent_num"] = configItem["bg_effect_transparent_num"].toDouble();

    foreach(auto v,configMap){
        qDebug()<<v;
    }
}

QVariantMap ConfigRead::getLycMap(QString fileNme)
{



    QFile lrcFile(fileNme);
    QVariantMap lycMap;
    if (!lrcFile.open(QIODevice::ReadOnly | QIODevice::Text))
        qDebug()<<"QVariantMap ConfigRead::getLycMap()";
        return QVariantMap();
    auto  res = QString(lrcFile.readAll());
    QRegularExpression re("\\[.*\\].*");
    int leftSize = 10;
    QRegularExpressionMatchIterator match = re.globalMatch(res);


    for (const QRegularExpressionMatch &sum : match) {
        QString unity = sum.captured(0);
        QString time = unity.sliced(1,8);
        QString lyc = unity.sliced(leftSize, unity.size()-leftSize);
        lycMap[time]=lyc;
    }
    return lycMap;
}
