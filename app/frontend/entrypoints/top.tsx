import React from 'react'
import ReactDOM from 'react-dom/client'
import Top from '../src/Top'
import Explanation from '../src/Explanation'

ReactDOM.createRoot(document.getElementById('top')!).render(
  <React.StrictMode>
    <Top />
    <Explanation />
  </React.StrictMode>
)