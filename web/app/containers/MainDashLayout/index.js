/**
 *
 * App.js
 *
 * This component is the skeleton around the actual pages, and should only
 * contain code that should be seen on all pages. (e.g. navigation bar)
 *
 * NOTE: while this component should technically be a stateless functional
 * component (SFC), hot reloading does not currently support SFCs. If hot
 * reloading is not a necessity for you then you can refactor it and remove
 * the linting exception.
 */

import React from 'react';
import { Switch, Route } from 'react-router-dom';

import Layout from 'containers/MainDashLayout/Layout';
import HomePage from 'containers/MainDashLayout/HomePage/Loadable';
import NotFoundPage from 'containers/NotFoundPage/Loadable';

export default function App() {
  return (
    <React.Fragment>
      <Layout>
        <Switch>
          <Route exact path="/dashboard" component={HomePage} />
          <Route component={NotFoundPage} />
        </Switch>
      </Layout>
    </React.Fragment>
  );
}
