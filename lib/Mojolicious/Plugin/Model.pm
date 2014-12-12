package Mojolicious::Plugin::Model;

use Mojo::Base 'Mojolicious::Plugin';

use MojoX::Models ();


# conf:
#   models
#     ModelName:
#       conf...
#   default: name...
#   namespaces: ns..

sub register {
	my ($self, $app, $args) = @_;

	my $mods = MojoX::Models->new;

	if (exists($args->{namespaces})) {
		my $val = $args->{namespaces};

		$mods->namespaces([grep { defined() } ref($val) eq 'ARRAY' ? @$val : $val]);
	}
	else {
		$mods->namespaces([ref($app) . '::Model']);
	}
	if (exists($args->{default})) {
		$app->defaults('mojox.model.current' => $args->{default});
	}
	if (exists($args->{models}) && ref($args->{models}) eq 'HASH') {
		my $val = $args->{models};

		$mods->load_model($_, $val->{$_}) for keys(%$val);
	}

	$app->helper(models => sub {
		return $mods;
	});
	$app->helper(model => sub {
		my ($self, $name) = @_;

		$name = $self->stash('mojox.model.current')
			if !$name && $self->stash('mojox.model.current');

		return $mods->model($name);
	});

	return;
}


1;
