use ExtUtils::MakeMaker;

$CC = 'g++';

# Generate the C++, XS, and Perl files that we need.

my $protoxs = "protoxs --cpp_out=. --out=transit_realtime transit_realtime.proto";

print "Generating C++ and Perl/XS sources...\n";
print "$protoxs\n";

`$protoxs`;
`rm -f transit_realtime/*.pm`;
`mv transit_realtime/*.xs .`;

# Now write the Makefile.

WriteMakefile(
	      'NAME'	      => 'transit_realtime',
	      'VERSION_FROM'  => 'transit_realtime.pm',
	      'OPTIMIZE'      => '-O2 -Wall',
              'CC'            => $CC,
              'LD'            => '$(CC)',
              'CCFLAGS'       => '-fno-strict-aliasing',
	      'OBJECT'        => 'transit_realtime.pb.o transit_realtime.o Alert.o EntitySelector.o FeedEntity.o FeedHeader.o FeedMessage.o Position.o TimeRange.o TranslatedString.o TripDescriptor.o TripUpdate.o VehicleDescriptor.o VehiclePosition.o',
              'INC'           =>  "",
	      'LIBS'          => [" -lprotobuf"],
              'XSOPT'         => '-C++',
	      clean           => { FILES => "transit_realtime/* Alert.* EntitySelector.* FeedEntity.* FeedHeader.* FeedMessage.* Position.* TimeRange.* TranslatedString.* TripDescriptor.* TripUpdate.* VehicleDescriptor.* VehiclePosition.* transit_realtime.pb.* lib" }
	     );

