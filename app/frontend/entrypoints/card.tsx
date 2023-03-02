import React from 'react'
import ReactDOM from 'react-dom/client'
import Card from '../src/Card'

const element = document.getElementById('graph');
const foreshadowings = element?.dataset['foreshadowings'] || '[]';
const cardforeshadowings = JSON.parse(foreshadowings);
ReactDOM.createRoot(element!).render(
  <React.StrictMode>
    <Card data={cardforeshadowings} />
  </React.StrictMode>
);