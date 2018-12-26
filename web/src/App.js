import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

const Login = () => <h2>Login</h2>
const Dashboard = () => <h2>Dashboard</h2>
const DashboardProto = () => <h2>DashboardProto</h2>

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <div>
            <Route exact path="/"         component={Login} />
            <Route path="/dashboard"      component={Dashboard} />
            <Route path="dashboard/proto" component={DashboardProto} />
            {/* 
              <Route exact path="/" component={} />
            */}
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
