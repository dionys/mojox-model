package MojoX::Models;

use Mojo::Base -base;
use Mojo::Loader ();


has namespaces => sub { [] };

has _models => sub { {} };


sub model {
	my ($self, $name) = @_;

	return unless $name;

	return $self->_models->{$name} if exists($self->_models->{$name});
	return;
}

sub load_model {
	my ($self, $name, $conf) = @_;

	for (map { $_ . '::' . $name } @{$self->namespaces}) {
		my $err = Mojo::Loader->new->load($_);

		die($err) if ref($err);
		next if $err;

		$self->_models->{$name} = $_->new($conf);

		return $self->_models->{$name};
	}

	die(qq[Model "$name" missing, maybe you need to install it?\n]);
}


1;
