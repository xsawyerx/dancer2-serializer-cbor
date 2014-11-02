package Dancer2::Serializer::CBOR;
# ABSTRACT: CBOR serializer for Dancer2

use Moo;
use CBOR::XS ();

with 'Dancer2::Core::Role::Serializer';

has '+content_type' => ( default => sub {'application/cbor'} );

sub loaded {1}

sub serialize {
    my ($self, $entity) = @_;
    CBOR::XS::encode_cbor($entity);
}

sub deserialize {
    my ($self, $content) = @_;
    CBOR::XS::decode_cbor($content);
}

1;

=head1 SYNOPSIS

    package MyApp::API::CBOR;
    use Dancer2;
    set serializer => 'CBOR';

    get '/view/user/:id' => sub {
        my $id = params->{'id'};

        return { user => get_id($id) };
    };

=head1 DESCRIPTION

This serializer allows to serialize and deserialize automatically the CBOR
(Concise Binary Object Representation) structure.

It requires L<CBOR::XS>.

=head1 METHODS

=head2 serialize

Serialize a Perl data structure to a CBOR structure.

=head2 deserialize

Deserialize a CBOR structure to a Perl data structure.

=head2 content_type

C<application/cbor>.

=head1 CREDIT

The test is based on code David Zurborg has written.

=head1 SEE ALSO

=over 4

=item * L<CBOR::XS>

=item * RFC7049

=back

