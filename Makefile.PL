use ExtUtils::MakeMaker;

my (
    $define,
    $libs
   );

# This may require some refinement
if ( $^O =~ /netbsd/i )
{
    $defined = "";
}
elsif ( $^O =~ /bsd/i )
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
       AUTHOR     => 'Jonathan Stowe <jns@gellyfish.co.uk>') : ()),
    'LIBS'		=> ['-lc'],
    'DEFINE'		=> $define,
    'INC'		=> '' 
);
