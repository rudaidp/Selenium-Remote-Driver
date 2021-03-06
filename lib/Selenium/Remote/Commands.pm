package Selenium::Remote::Commands;

use strict;
use warnings;

# ABSTRACT: Implement commands for Selenium::Remote::Driver

=head1 DESCRIPTION

Defines all the HTTP endpoints available to execute on a selenium server.

If you have either a customized Selenium Server, or want new features
you should update the _cmds hash.

=for Pod::Coverage *EVERYTHING*

=cut

use Moo;

has '_cmds' => (
    is      => 'lazy',
    reader  => 'get_cmds',
    builder => sub {
        return {
            'status' => {
                'method'             => 'GET',
                'url'                => 'status',
                'no_content_success' => 0
            },
            'newSession' => {
                'method'             => 'POST',
                'url'                => 'session',
                'no_content_success' => 0
            },
            'getSessions' => {
                'method'             => 'GET',
                'url'                => 'sessions',
                'no_content_success' => 0
            },
            'getCapabilities' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId',
                'no_content_success' => 0
            },
            'setTimeout' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/timeouts',
                'no_content_success' => 1
            },
            'setAsyncScriptTimeout' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/timeouts/async_script',
                'no_content_success' => 1
            },
            'setImplicitWaitTimeout' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/timeouts/implicit_wait',
                'no_content_success' => 1
            },
            'quit' => {
                'method'             => 'DELETE',
                'url'                => 'session/:sessionId',
                'no_content_success' => 1
            },
            'getCurrentWindowHandle' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/window_handle',
                'no_content_success' => 0
            },
            'getWindowHandles' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/window_handles',
                'no_content_success' => 0
            },
            'getWindowSize' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/window/:windowHandle/size',
                'no_content_success' => 0
            },
            'getWindowPosition' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/window/:windowHandle/position',
                'no_content_success' => 0
            },
            'maximizeWindow' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/window/:windowHandle/maximize',
                'no_content_success' => 1
            },
            'setWindowSize' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/window/:windowHandle/size',
                'no_content_success' => 1
            },
            'setWindowPosition' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/window/:windowHandle/position',
                'no_content_success' => 1
            },
            'getCurrentUrl' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/url',
                'no_content_success' => 0
            },
            'get' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/url',
                'no_content_success' => 1
            },
            'goForward' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/forward',
                'no_content_success' => 1
            },
            'goBack' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/back',
                'no_content_success' => 1
            },
            'refresh' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/refresh',
                'no_content_success' => 1
            },
            'executeScript' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/execute',
                'no_content_success' => 0
            },
            'executeAsyncScript' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/execute_async',
                'no_content_success' => 0
            },
            'screenshot' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/screenshot',
                'no_content_success' => 0
            },
            'availableEngines' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/ime/available_engines',
                'no_content_success' => 0
            },
            'switchToFrame' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/frame',
                'no_content_success' => 1
            },
            'switchToWindow' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/window',
                'no_content_success' => 1
            },
            'getAllCookies' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/cookie',
                'no_content_success' => 0
            },
            'addCookie' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/cookie',
                'no_content_success' => 1
            },
            'deleteAllCookies' => {
                'method'             => 'DELETE',
                'url'                => 'session/:sessionId/cookie',
                'no_content_success' => 1
            },
            'deleteCookieNamed' => {
                'method'             => 'DELETE',
                'url'                => 'session/:sessionId/cookie/:name',
                'no_content_success' => 1
            },
            'getPageSource' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/source',
                'no_content_success' => 0
            },
            'getTitle' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/title',
                'no_content_success' => 0
            },
            'findElement' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/element',
                'no_content_success' => 0
            },
            'findElements' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/elements',
                'no_content_success' => 0
            },
            'getActiveElement' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/element/active',
                'no_content_success' => 0
            },
            'describeElement' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/element/:id',
                'no_content_success' => 0
            },
            'findChildElement' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/element/:id/element',
                'no_content_success' => 0
            },
            'findChildElements' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/element/:id/elements',
                'no_content_success' => 0
            },
            'clickElement' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/element/:id/click',
                'no_content_success' => 1
            },
            'submitElement' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/element/:id/submit',
                'no_content_success' => 1
            },
            'sendKeysToElement' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/element/:id/value',
                'no_content_success' => 1
            },
            'sendKeysToActiveElement' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/keys',
                'no_content_success' => 1
            },
            'sendModifier' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/modifier',
                'no_content_success' => 1
            },
            'isElementSelected' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/element/:id/selected',
                'no_content_success' => 0
            },
            'setElementSelected' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/element/:id/selected',
                'no_content_success' => 0
            },
            'toggleElement' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/element/:id/toggle',
                'no_content_success' => 0
            },
            'isElementEnabled' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/element/:id/enabled',
                'no_content_success' => 0
            },
            'getElementLocation' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/element/:id/location',
                'no_content_success' => 0
            },
            'getElementLocationInView' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/element/:id/location_in_view',
                'no_content_success' => 0
            },
            'getElementTagName' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/element/:id/name',
                'no_content_success' => 0
            },
            'clearElement' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/element/:id/clear',
                'no_content_success' => 1
            },
            'getElementAttribute' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/element/:id/attribute/:name',
                'no_content_success' => 0
            },
            'elementEquals' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/element/:id/equals/:other',
                'no_content_success' => 0
            },
            'isElementDisplayed' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/element/:id/displayed',
                'no_content_success' => 0
            },
            'close' => {
                'method'             => 'DELETE',
                'url'                => 'session/:sessionId/window',
                'no_content_success' => 1
            },
            'getElementSize' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/element/:id/size',
                'no_content_success' => 0
            },
            'getElementText' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/element/:id/text',
                'no_content_success' => 0
            },
            'getElementValueOfCssProperty' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/element/:id/css/:propertyName',
                'no_content_success' => 0
            },
            'mouseMoveToLocation' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/moveto',
                'no_content_success' => 1
            },
            'getAlertText' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/alert_text',
                'no_content_success' => 0
            },
            'sendKeysToPrompt' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/alert_text',
                'no_content_success' => 1
            },
            'acceptAlert' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/accept_alert',
                'no_content_success' => 1
            },
            'dismissAlert' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/dismiss_alert',
                'no_content_success' => 1
            },
            'click' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/click',
                'no_content_success' => 1
            },
            'doubleClick' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/doubleclick',
                'no_content_success' => 1
            },
            'buttonDown' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/buttondown',
                'no_content_success' => 1
            },
            'buttonUp' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/buttonup',
                'no_content_success' => 1
            },
            'generalAction' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/actions',
                'no_content_success' => 1
            },
            'uploadFile' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/file',
                'no_content_success' => 0
            },
            'getLocalStorageItem' => {
                'method'             => 'GET',
                'url'                => '/session/:sessionId/local_storage/key/:key',
                'no_content_success' => 0
            },
            'deleteLocalStorageItem' => {
                'method'             => 'DELETE',
                'url'                => '/session/:sessionId/local_storage/key/:key',
                'no_content_success' => 1
            },
            'cacheStatus' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/application_cache/status',
                'no_content_success' => 0
            },
            'setGeolocation' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/location',
                'no_content_success' => 1
            },
            'getGeolocation'   => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/location',
                'no_content_success' => 0
            },
            'getLog' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/log',
                'no_content_success' => 0
            },
            'getLogTypes'   => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/log/types',
                'no_content_success' => 0
            },
            'setOrientation' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/orientation',
                'no_content_success' => 1
            },
            'getOrientation'   => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/orientation',
                'no_content_success' => 0
            },
            # firefox extension
            'setContext' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/moz/context',
                'no_content_success' => 1
            },
            'getContext' => {
                'method'             => 'GET',
                'url'                => 'session/:sessionId/moz/context',
                'no_content_success' => 0
            },

            # geckodriver workarounds
            'executeScriptGecko' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/execute/sync',
                'no_content_success' => 0
            },
            'executeAsyncScriptGecko' => {
                'method'             => 'POST',
                'url'                => 'session/:sessionId/execute/async',
                'no_content_success' => 0
            },

            # /session/:sessionId/local_storage
            # /session/:sessionId/local_storage/key/:key
            # /session/:sessionId/local_storage/size
            # /session/:sessionId/session_storage
            # /session/:sessionId/session_storage/key/:key
            # /session/:sessionId/session_storage/size

        };
    }
);

# helper methods to manipulate the _cmds hash
sub get_url {
    my ( $self, $command ) = @_;
    return $self->get_cmds->{$command}->{url};
}

sub get_method {
    my ( $self, $command ) = @_;
    return $self->get_cmds->{$command}->{method};
}

sub get_no_content_success {
    my ( $self, $command ) = @_;
    return $self->get_cmds->{$command}->{no_content_success};
}

# This method will replace the template & return
sub get_params {
    my ( $self, $args ) = @_;
    if ( !( defined $args->{'session_id'} ) ) {
        return;
    }
    my $data    = {};
    my $command = $args->{'command'};
    my $url     = $self->get_url($command);

    # Do the var substitutions.
    $url =~ s/:sessionId/$args->{'session_id'}/;
    $url =~ s/:id/$args->{'id'}/;
    $url =~ s/:name/$args->{'name'}/;
    $url =~ s/:propertyName/$args->{'property_name'}/;
    $url =~ s/:other/$args->{'other'}/;
    $url =~ s/:windowHandle/$args->{'window_handle'}/;

    $data->{'method'} = $self->get_method($command);
    $data->{'no_content_success'} = $self->get_no_content_success($command);
    $data->{'url'}    = $url;

    return $data;
}

1;

__END__
