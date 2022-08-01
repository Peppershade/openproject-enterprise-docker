FROM openproject/community:12

# If installing a local plugin (using `path:` in the `Gemfile.plugins` above),
# you will have to copy the plugin code into the container here and use the
# path inside of the container. Say for `/app/vendor/plugins/openproject-slack`:
# COPY /path/to/my/local/openproject-slack /app/vendor/plugins/openproject-slack

COPY Gemfile.plugins /app/

# If the plugin uses any external NPM dependencies you have to install them here.
# RUN npm add npm <package-name>*

RUN bundle config unset deployment && bundle install && bundle config set deployment 'true'
RUN ./docker/prod/setup/postinstall.sh
RUN rm /app/app/models/enterprise_token.rb
RUN curl https://gist.githubusercontent.com/markasoftware/f5b2e55a2c2e3abb1f9eefcdf0bfff45/raw/f7f3bb454d2375d9396cba14802f9b96ed956d10/enterprise_token.rb