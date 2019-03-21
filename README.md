Automação Mobile Android - Ruby - Calabash - Cucumber - Emulador
=======================================================================

[Criar um AVD](https://developer.android.com/studio/run/managing-avds?hl=pt-br#createavd)


### Documentação

  - [Gradle (build tool)](https://gradle.org/)
  - [Ruby API](https://github.com/calabash/calabash-android/blob/master/documentation/ruby_api.md)
  - [Calabash (Wiki)](https://github.com/calabash/calabash-android/wiki/05-Query-Syntax)

### Dependencias

#### Ruby

É necessário ter instalado o ruby

[RubyInstaller.org](http://rubyinstaller.org/)

Verifique sua instalação executando

```ruby
ruby -v
```

No terminal, deve ser mostrado ou similar

```ruby
ruby 2.3.1p112
```

#### Java Development Kit (JDK)

É necessário ter instalado o Java Development Kit (JDK) e acessivel.

A variavel de ambiente `JAVA_HOME` deve estar definida

#### Android SDK

É necessário ter instalado o Android SDK. Você pode fazer download aqui [Android Studio](http://developer.android.com/sdk/index.html)
A variavel de ambiente `ANDROID_HOME` deve estar definida

#### Gem Bundler

É necessário ter instalada essa gem, para que possa ser executado o comando na raiz do projeto

```ruby
bundle install
```
Após a execução do comando, serão baixadas as dependencias definidas no arquivo Gemfile

```ruby
# Contents of Gemfile
source "https://rubygems.org"

gem 'calabash-android'
gem 'calabash-cucumber'
gem 'report_builder', '~> 1.6'
gem 'activesupport-inflector', '~> 0.1.0'
```

### Build

Basta utilizar o gradle wrapper presente na raiz do projeto:

```groovy
 ./gradlew build
```
### Troca de APK

Basta executar o comando na raiz do projeto, local onde esta a apk com o nome da nova apk que foi inserida na pasta raiz do projeto:

```Ruby
calabash-android resign <apk>
```

### Execução

Basta executar o comando na raiz do projeto:

```Ruby
calabash-android run <apk> -p <sistema operacional> -p <ambiente> --t <tag>
```
