#include "configread.h"
#include <QDir>
ConfigRead::ConfigRead()
{

}

QString ConfigRead::ReadJsonFile()
{
    QFile file("./config.json");

    file.open(QIODevice::ReadOnly | QIODevice::Text);
    if(!file.exists()){
        qDebug()<<"ERROR THIS IS ERROR CONFIG JSON FILR ConfigRead::ReadJsonFile()";
        std::terminate();
    }
    QString value = file.readAll();
    file.close();
    return value;
}

void  ConfigRead::paserJson()
{

    QString jsonData = ReadJsonFile();


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
    this->configMap["filePath"] = configItem["filePath"].toString();
    this->configMap["fileLycPath"] = configItem["fileLycPath"].toString();
    foreach(auto v,configMap){
        qDebug()<<v;
    }
}

QVariantMap ConfigRead::getLycMap(QString fileNme)
{
    qDebug()<<"QVariantMap fileNme IS NULL"<<fileNme;
    QDir currentpath = QDir(filePath);
    QVariantMap lycMap;

    if(!currentpath.exists())
    {
        return QVariantMap();
    }
    QStringList filters{"*.lrc"};
    currentpath.setNameFilters(filters);
    QFileInfoList list = currentpath.entryInfoList();

    foreach(auto lists,list){
        if(lists.filePath().contains(fileNme,Qt::CaseInsensitive)){
            qDebug()<<"if(lists.filePath().contains("<<lists;
            QFile lrcFile(lists.filePath());
            QStringList timeLsit;
            QStringList lycLsit;


            if (!lrcFile.open(QIODevice::ReadOnly | QIODevice::Text)){
                qDebug()<<"QVariantMap ConfigRead::getLycMap()";
                return QVariantMap();
            }

            auto  res = QString(lrcFile.readAll());
            QRegularExpression re("\\[.*\\].*");
            int leftSize = 10;
            QRegularExpressionMatchIterator match = re.globalMatch(res);


            QString previousWord;
            QString previousTime;
            for (const QRegularExpressionMatch &sum : match) {
                QString unity = sum.captured(0);


                if(unity.size()>10){
                    QString time = unity.sliced(1,5);
                    QString lyc = unity.sliced(leftSize, unity.size()-leftSize);

                    //??????????????????????????????
                    //?????????????????????
                    if(previousWord.isEmpty()){
                        previousWord= lyc;
                        previousTime = time;
                        continue;
                    }
                    if(time == previousTime){
                        previousWord.append("\r\n");
                        previousWord.append(lyc);
                        timeLsit.append(time);
                        lycLsit.append(previousWord);
                        previousTime.clear();
                        previousWord.clear();
                    }
                    else{
                        timeLsit.append(previousTime);
                        lycLsit.append(previousWord);
                        previousTime = time;
                        previousWord = lyc;

                    }
                }


            }
            lycMap["time"]=timeLsit;
            lycMap["lyc"]=lycLsit;

            return lycMap;
        }
    }
    qDebug()<<"QVariantMap ConfigRead::getLycMap(QString fileNme)IS NULL";
    return lycMap;
}

void ConfigRead::setFilePath(QString fileKeyName,QString value)
{
    {
#ifdef __linux__
        filePath = filePath.replace("file:///","/");
#endif
#ifdef _WIN32
        filePath = filePath.replace("file:///","");//windwos not need absolute path
#endif
        this->filePath = fileKeyName;
        qDebug()<<"void ConfigRead::setFilePath(QString filePath)"<<this->filePath;
        set_config_key(fileKeyName,value);
    }
}

template<typename T>
void ConfigRead::set_config_key(QString key, T value)
{
    QString jsonData = this->ReadJsonFile();
    QJsonParseError parseJsonErr;
    QJsonDocument document = QJsonDocument::fromJson(jsonData.toUtf8(), &parseJsonErr);
    if (! (parseJsonErr.error == QJsonParseError::NoError)) {
        qDebug()<<"THIS IS ERROR void ConfigRead::set_file_path()";
        return ;
    }
    QJsonObject jsonObject = document.object();
    jsonObject[key] = value;
    QFile file("./config.json");
    file.open(QIODevice::WriteOnly | QIODevice::Text);
    QJsonDocument filedoc(jsonObject);
    file.write(filedoc.toJson());
}
