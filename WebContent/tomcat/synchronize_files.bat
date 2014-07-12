@ECHO OFF
XCOPY %cd%\common F:\Work\Liferay\liferay-portal-tomcat-6.0.6\tomcat-6.0.29\webapps\ROOT\html\common /D /S /C /H /R /Y
XCOPY %cd%\company F:\Work\Liferay\liferay-portal-tomcat-6.0.6\tomcat-6.0.29\webapps\ROOT\html\company /D /S /C /H /R /Y
XCOPY %cd%\classes F:\Work\Liferay\liferay-portal-tomcat-6.0.6\tomcat-6.0.29\webapps\ROOT\WEB-INF\classes /D /S /C /H /R /Y
PAUSE