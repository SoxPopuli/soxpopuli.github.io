//import logo from './logo.svg';
import './App.css';

import React from 'react';
import { Component } from 'react';

import { 
    BrowserRouter as Router,
    Routes,
    Route,
    NavLink,
} from 'react-router-dom';

class MenuEntry {
    name: string
    to: string

    constructor(name: string, to: string) {
        this.name = name
        this.to = to
    }
}

class Header extends Component {
    constructor(props: any) {
        super(props)
    }

    readonly menu_items = [
        new MenuEntry("Home", "/"),
        new MenuEntry("Test A", "/test1"),
        new MenuEntry("Test B", "/test2"),
    ]

    render() {
        let menu = this.menu_items.map(e => 
            <li key={e.name}>
                <NavLink to={e.to}>{e.name}</NavLink>
           </li>
        );

        return (
            <div className="menu-container">
                <h1>Hello</h1>
                <ul className='menu-list'>
                    {menu}
                </ul>
            </div>
        );
    }
}


class Home extends Component {
    constructor(props: any) {
        super(props)
    }

    render() {
        return <p>Homepage</p>
    }

}

function Test1() {
    return <p>test 1</p>;
}

function Test2() {
    return <p>test 2</p>;
}

function App() {
  return (
      <Router basename={`/${process.env.PUBLIC_URL}`}>
          <Header/>
          <Routes>
              <Route path="/" element={<Home/>}/>
              <Route path="/test1" element={<Test1/>}/>
              <Route path="/test2" element={<Test2/>}/>
          </Routes>
      </Router>
  );
}

export default App;
