@echo off
echo The following Maven command installs your Maven-built Java application
echo into the local Maven repository, which will ultimately be stored in
echo Jenkins's local Maven repository (and the "maven-repository" Docker data
echo volume).

call mvn.cmd install

echo The following command extracts the value of the <name/> element
echo within <project/> of your Java/Maven project's "pom.xml" file.
for /f "tokens=*" %%g in ('mvn.cmd -q -DforceStdout help:evaluate -Dexpression=project.name') do (set NAME=%%g)

echo The following command behaves similarly to the previous one but
echo extracts the value of the <version/> element within <project/> instead.
for /f "tokens=*" %%g in ('mvn.cmd -q -DforceStdout help:evaluate -Dexpression=project.version') do (set VERSION=%%g)

echo The following command runs and outputs the execution of your Java
echo application (which Jenkins built using Maven) to the Jenkins UI.
call java -jar target\%NAME%-%VERSION%.jar