import { useCallback } from 'react';

import { FormattedMessage } from 'react-intl';


import { LoginButton } from '@inrupt/solid-ui-react';

import { openModal } from 'mastodon/actions/modal';
import { registrationsOpen, sso_redirect } from 'mastodon/initial_state';
import { useAppDispatch, useAppSelector } from 'mastodon/store';

const SignInBanner = () => {
  const dispatch = useAppDispatch();

  const openClosedRegistrationsModal = useCallback(
    () => dispatch(openModal({ modalType: 'CLOSED_REGISTRATIONS' })),
    [dispatch],
  );

  let signupButton;

  const signupUrl = useAppSelector((state) => state.getIn(['server', 'server', 'registrations', 'url'], null) || '/auth/sign_up');

  if (sso_redirect) {
    return (
      <div className='sign-in-banner'>
        <p><FormattedMessage id='sign_in_banner.text' defaultMessage='Login to follow profiles or hashtags, favorite, share and reply to posts. You can also interact from your account on a different server.' /></p>
        <a href={sso_redirect} data-method='post' className='button button--block button-tertiary'><FormattedMessage id='sign_in_banner.sso_redirect' defaultMessage='Login or Register' /></a>
      </div>
    )
  }

  if (registrationsOpen) {
    signupButton = (
      <a href={signupUrl} className='button button--block'>
        <FormattedMessage id='sign_in_banner.create_account' defaultMessage='Create account' />
      </a>
    );
  } else {
    signupButton = (
      <button className='button button--block' onClick={openClosedRegistrationsModal}>
        <FormattedMessage id='sign_in_banner.create_account' defaultMessage='Create account' />
      </button>
    );
  }

  return (
    <div className='sign-in-banner'>
      <p><FormattedMessage id='sign_in_banner.text' defaultMessage='Login to follow profiles or hashtags, favorite, share and reply to posts. You can also interact from your account on a different server.' /></p>
      {signupButton}
      <a href='/auth/sign_in' className='button button--block button-tertiary'><FormattedMessage id='sign_in_banner.sign_in' defaultMessage='Login' /></a>
      <LoginButton onError={console.error} oidcIssuer='https://login.inrupt.com' redirectUrl={new URL("/auth/openid_connect/callback", window.location.href).toString()} />
    </div>

  );
};

export default SignInBanner;
