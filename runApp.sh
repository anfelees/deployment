cd ../checkout
sh gradlew clean
sh gradlew build
cd ../bill
sh gradlew clean
sh gradlew build
cd ../logistic
sh gradlew clean
sh gradlew build
cd ../docker-compose
docker-compose build
docker-compose up