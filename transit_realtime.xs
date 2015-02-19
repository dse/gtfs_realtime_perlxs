#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif

// Taken from Glib and Gtk

static void
call_XS ( pTHX_ void (*subaddr) (pTHX_ CV *), CV * cv, SV ** mark )
{
  dSP;
  PUSHMARK (mark);
  (*subaddr) (aTHX_ cv);
  PUTBACK;
}

#define CALL_BOOT(name)	call_XS (aTHX_ name, cv, mark)

// We need these declarations with "C" linkage

#ifdef __cplusplus
extern "C" {
#endif
  XS(boot_transit_realtime__Alert);
  XS(boot_transit_realtime__EntitySelector);
  XS(boot_transit_realtime__FeedEntity);
  XS(boot_transit_realtime__FeedHeader);
  XS(boot_transit_realtime__FeedMessage);
  XS(boot_transit_realtime__Position);
  XS(boot_transit_realtime__TimeRange);
  XS(boot_transit_realtime__TranslatedString);
  XS(boot_transit_realtime__TripDescriptor);
  XS(boot_transit_realtime__TripUpdate);
  XS(boot_transit_realtime__VehicleDescriptor);
  XS(boot_transit_realtime__VehiclePosition);
#ifdef __cplusplus
}
#endif

// Bootstrap this module by bootstrapping all of the others.

MODULE = Local::transit_realtime	PACKAGE = Local::transit_realtime

BOOT:
	CALL_BOOT(boot_transit_realtime__Alert);
	CALL_BOOT(boot_transit_realtime__EntitySelector);
	CALL_BOOT(boot_transit_realtime__FeedEntity);
	CALL_BOOT(boot_transit_realtime__FeedHeader);
	CALL_BOOT(boot_transit_realtime__FeedMessage);
	CALL_BOOT(boot_transit_realtime__Position);
	CALL_BOOT(boot_transit_realtime__TimeRange);
	CALL_BOOT(boot_transit_realtime__TranslatedString);
	CALL_BOOT(boot_transit_realtime__TripDescriptor);
	CALL_BOOT(boot_transit_realtime__TripUpdate);
	CALL_BOOT(boot_transit_realtime__VehicleDescriptor);
	CALL_BOOT(boot_transit_realtime__VehiclePosition);
