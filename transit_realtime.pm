package transit_realtime;

use strict;
use warnings;
use vars qw(@ISA $AUTOLOAD $VERSION);

$VERSION = '1.0';

use Exporter;

require DynaLoader;
require AutoLoader;

@ISA = qw(DynaLoader Exporter);

bootstrap transit_realtime $VERSION;

1;

__END__

