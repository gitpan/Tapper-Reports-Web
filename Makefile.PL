
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Tapper - Frontend web application based on Catalyst",
  "AUTHOR" => "AMD OSRC Tapper Team <tapper\@amd64.org>",
  "BUILD_REQUIRES" => {
    "Tapper::Schema::TestTools" => 0,
    "Test::Deep" => 0,
    "Test::Fixture::DBIC::Schema" => 0,
    "Test::More" => 0,
    "Test::WWW::Mechanize::Catalyst" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Tapper-Reports-Web",
  "EXE_FILES" => [],
  "LICENSE" => "open_source",
  "NAME" => "Tapper::Reports::Web",
  "PREREQ_PM" => {
    "Authen::Simple::PAM" => 0,
    "Catalyst" => 0,
    "Catalyst::Authentication::Credential::Authen::Simple" => 0,
    "Catalyst::Controller" => 0,
    "Catalyst::Controller::BindLex" => 0,
    "Catalyst::Controller::HTML::FormFu" => 0,
    "Catalyst::Model::DBIC::Schema" => 0,
    "Catalyst::Plugin::Authentication" => 0,
    "Catalyst::Plugin::ConfigLoader" => 0,
    "Catalyst::Plugin::Session" => 0,
    "Catalyst::Plugin::Session::State::Cookie" => 0,
    "Catalyst::Plugin::Session::Store::File" => 0,
    "Catalyst::Plugin::Static::Simple" => 0,
    "Catalyst::Runtime" => 0,
    "Catalyst::View::Mason" => 0,
    "Class::C3::Adopt::NEXT" => 0,
    "Cwd" => 0,
    "Data::DPath" => 0,
    "Data::Dumper" => 0,
    "DateTime" => 0,
    "DateTime::Format::DateParse" => 0,
    "DateTime::Format::Natural" => 0,
    "DateTime::Format::Strptime" => 0,
    "DateTime::Format::W3CDTF" => 0,
    "FCGI" => 0,
    "File::Basename" => 0,
    "File::Copy::Recursive" => 0,
    "File::Find::Rule" => 0,
    "File::Path" => 0,
    "File::stat" => 0,
    "HTML::FromANSI" => 0,
    "Hash::Merge" => 0,
    "Hash::Merge::Simple" => 0,
    "Module::Find" => "0.11",
    "Moose" => 0,
    "Perl6::Junction" => 0,
    "Set::Intersection" => 0,
    "Tapper::Cmd::Precondition" => 0,
    "Tapper::Cmd::Testrun" => 0,
    "Tapper::Config" => 0,
    "Tapper::Model" => 0,
    "Tapper::Testplan::Plugins::Taskjuggler" => 0,
    "Tapper::Testplan::Reporter" => 0,
    "Template" => 0,
    "XML::Feed" => 0,
    "YAML" => 0,
    "YAML::Syck" => 0,
    "base" => 0,
    "common::sense" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "4.0.4",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



