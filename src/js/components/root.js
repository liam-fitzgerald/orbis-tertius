import React, { Component } from "react";
import { BrowserRouter, Route } from "react-router-dom";
import classnames from "classnames";
import _ from "lodash";
import { store } from "/store";
import { HeaderBar } from "./lib/header-bar.js";
import { Battery } from "./Battery";
import { Detail } from "./Detail";
import { api } from "../api";

export class Root extends Component {
  constructor(props) {
    super(props);
    this.state = { ...store.state };
    store.setStateHandler(this.setState.bind(this));
    this.setXkey = this.setXkey.bind(this);
  }

  setXkey(xkey, name) {
    api.orbis(xkey);
    this.setState({
      xkey,
      name
    });
  }

  render() {
    console.log(this.state);
    const battery = _.get(this.state, "docs[2].xdat.batt", []);
    return (
      <BrowserRouter>
        <div>
          <HeaderBar />
          <Route
            exact
            path="/~orbis"
            render={() => {
              return (
                <div className="pa3 w-100">
                  <h1 className="mt0 f2">orbis</h1>
                  <div className="flex">
                    <Battery battery={battery} onSelect={this.setXkey} />
                    <Detail
                      docs={this.state.docs}
                      xkey={this.state.xkey}
                      name={this.state.name}
                    />
                  </div>
                </div>
              );
            }}
          />
        </div>
      </BrowserRouter>
    );
  }
}
