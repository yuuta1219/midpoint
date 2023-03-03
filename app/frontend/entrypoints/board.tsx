import React from 'react'
import ReactDOM from 'react-dom/client'
import App from '../src/App'

const element = document.getElementById('root');
const cardsJson = element?.dataset['cards'] || '[]'; 
const cards = JSON.parse(cardsJson);
ReactDOM.createRoot(element!).render(
  <React.StrictMode>
    <App data={cards} />
  </React.StrictMode>
);

