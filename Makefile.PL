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
    'VERSION_FROM'	=> 'Utmp.pm',
    'PREREQ_PM'		=> {},
    ($] >= 5.005 ?    
      (ABSTRACT_FROM => 'Utmp.pm',
       AUTHOR     => 'Jonathan Stowe <jonathan.stowe@netscalibur.co.uk>') : ()),
    'LIBS'		=> ['-lc'],
    'DEFINE'		=> $define,
    'INC'		=> '' 
);
