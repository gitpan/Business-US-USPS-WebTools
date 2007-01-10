# $Id: Makefile.PL,v 1.5 2007/01/10 05:37:53 comdog Exp $
use ExtUtils::MakeMaker;

eval "use Test::Manifest 1.14";

WriteMakefile(
	'NAME'	       => 'Business::US::USPS::WebTools',
	'VERSION_FROM' => 'lib/WebTools.pm',
	'LICENSE'       => 'perl',

	'PREREQ_PM'    => {
		'Test::More'     => '0',
		'Hash::AsObject' => '0',
		'Test::Manifest' => 1.14,
		'LWP::Simple'    => '0',
		},

	'PM'           => {
		'lib/WebTools.pm'               => '$(INST_LIBDIR)/WebTools.pm',
		'lib/AddressStandardization.pm' => '$(INST_LIBDIR)/WebTools/AddressStandardization.pm',
		'lib/ZipCodeLookup.pm'          => '$(INST_LIBDIR)/WebTools/ZipCodeLookup.pm',
		'lib/CityStateLookup.pm'        => '$(INST_LIBDIR)/WebTools/CityStateLookup.pm',
		},

	'MAN3PODS'     => {
		'lib/WebTools.pm'               => '$(INST_MAN3DIR)/Business::US::USPS::WebTools.3',
		'lib/AddressStandardization.pm' => '$(INST_LIBDIR)/Business::US::USPS::WebTools::AddressStandardization.3',
		'lib/ZipCodeLookup.pm'          => '$(INST_LIBDIR)/Business::US::USPS::WebTools::ZipCodeLookup.3',
		'lib/CityStateLookup.pm'        => '$(INST_LIBDIR)/Business::US::USPS::WebTools::CityStateLookup.3',
		},

	clean  => { FILES    => q|Business-*| },

	);

print <<"HERE" unless( $ENV{USPS_WEBTOOLS_USERID} and $ENV{USPS_WEBTOOLS_PASSWORD} );
----------------------------------------------------------------------------

To use these modules, you need a User ID and Password from the US Postal
Service. See the USPS website for details:

http://www.usps.com/webtools/htm/Address-Information.htm

Set the USPS_WEBTOOLS_USERID and USPS_WEBTOOLS_PASSWORD environment
variables.

----------------------------------------------------------------------------
HERE