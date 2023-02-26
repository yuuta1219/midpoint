import React from 'react'
import ReactDOM from 'react-dom/client'
import App from '../src/App'

const element = document.getElementById('root');
const cardsJson = element?.dataset['cards'] || '[]'; // 空の場合、空の配列を代入する
const cards = JSON.parse(cardsJson);
ReactDOM.createRoot(element!).render(
  <React.StrictMode>
    <App data={cards} />
  </React.StrictMode>
);

