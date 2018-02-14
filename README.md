# Overview
This repository contains recipes for the deployment of [__identifiers.org__](http://identifiers.org) **Satellite Infrastructure** on different cloud and non-cloud platforms.


# Platforms
Deployment recipes can be found organized by platform under the _platform_ folder of this repository.


## Docker Compose based deployments
Within subfolder _docker-compose_, you can download the [**docker-compose.yml**](https://raw.githubusercontent.com/identifiers-org/cloud-devops-satellite/master/platforms/docker-compose/docker-compose.yml) script and fill in the values for the following environment variables before launching the _Satellite Platform_:

```vim
- WS_REGISTRY_CONFIG_EMAIL_HOST=set_your_environment_value
- WS_REGISTRY_CONFIG_EMAIL_PORT=set_your_environment_value
- WS_REGISTRY_CONFIG_EMAIL_USERNAME=set_your_environment_value
- WS_REGISTRY_CONFIG_EMAIL_PASSWORD=set_your_environment_value
- WS_REGISTRY_CONFIG_EMAIL_TRANSPORT_PROTOCOL=set_your_environment_value
- WS_REGISTRY_CONFIG_EMAIL_BOOLEAN_SMTP_AUTH=set_your_environment_value
- WS_REGISTRY_CONFIG_EMAIL_BOOLEAN_START_TLS=set_your_environment_value
- WS_REGISTRY_CONFIG_EMAIL_BOOLEAN_DEBUG=set_your_environment_value
```

Below these lines we show an example on how to fill in the values for this environment variables when using a _Gmail account_ credentials (**you will need to enable 'less secure' apps in the security section of your e-mail account**, because the current version of this service doesn't support OAuth2 yet).

```vim
- WS_REGISTRY_CONFIG_EMAIL_HOST=smtp.gmail.com
- WS_REGISTRY_CONFIG_EMAIL_PORT=587
- WS_REGISTRY_CONFIG_EMAIL_USERNAME=email_account@gmail.com
- WS_REGISTRY_CONFIG_EMAIL_PASSWORD=email_account_password
- WS_REGISTRY_CONFIG_EMAIL_TRANSPORT_PROTOCOL=smtp
- WS_REGISTRY_CONFIG_EMAIL_BOOLEAN_SMTP_AUTH=true
- WS_REGISTRY_CONFIG_EMAIL_BOOLEAN_START_TLS=true
- WS_REGISTRY_CONFIG_EMAIL_BOOLEAN_DEBUG=true
```

Once these changes have been made to the _docker-compose.yml_ file, you can launch [__identifiers.org__](http://identifiers.org) **Satellite Infrastructure** using the following command (from the folder where you have this _docker-compose.yml_ file):

> docker-compose up -d

To Stop [__identifiers.org__](http://identifiers.org) **Satellite Infrastructure**, you can use this command (from the folder where you have this _docker-compose.yml_ file):

> docker-compose down


# Contributions
Documentation for developers will be coming soon, through the repository Wiki.


### Contact
Manuel Bernal Llinares
