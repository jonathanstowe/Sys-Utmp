use ExtUtils::MakeMaker;

my (
    $define,
    $libs
   );

if ( $^O =~ /bsd/i )
{
   $define = '-DNOUTFUNCS';
}
else
{
   $define = '';
}

if ( $^O eq 'sco' )
{
  $libs = ['-lc'];
}
else
{
  $libs = [''];
}

WriteMakefile(
    'NAME'		=> 'Sys::Utmp',
    'VERSION_FROM'	=> 'lib/Sys/Utmp.pm',
    'PREREQ_PM'		=> {Test::More => 0 },
    ($] >= 5.005 ?    
      (ABSTRACT_FROM => 'lib/Sys/Utmp.pm',
       AUTHOR     => 'Jonathan Stowe <jns@gellyfish>') : ()),
    'LIBS'		=> ['-lc'],
    'DEFINE'		=> $define,
    'INC'		=> '' 
);
