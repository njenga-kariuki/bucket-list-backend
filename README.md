# Travel-Ease: Rails API

The backend for a travel planning application, with account authentication, saved trips, destination research and trip notes. It supports the [Travel-Ease React frontend](https://github.com/njenga-kariuki/bucket-list-app); the two repositories form one project built by Njenga Kariuki in 2019.

**Historical project.** This preserves the original Rails implementation. Its dependencies, third-party pages and scraping logic have not been revalidated for current use.

## Implementation

- Rails API with PostgreSQL and serialized responses for users, trips, destinations and notes.
- Password authentication with bcrypt and JWT-based API access.
- Destination research collected through Nokogiri and Mechanize, with scheduled tasks for data updates.

## Original local configuration

The project uses Rails 5.1 and PostgreSQL. Database settings are in `config/database.yml`; routes are in `config/routes.rb`. The frontend expects this API at `http://localhost:3000/api/v1`.

Copy `.env.example` to `.env` and set independent, freshly generated values for `JWT_SECRET` and `SECRET_KEY_BASE`. Generate each locally, for example with `ruby -rsecurerandom -e 'puts SecureRandom.hex(64)'`. Keep `.env` private. Production configuration must supply these values through the environment.

The original setup used `bundle install`, database creation and migration, and a Rails server. These are historical setup notes; the application has not been run against current dependencies or services as part of this publication.
