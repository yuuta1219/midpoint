import React from 'react'
import Fade from 'react-reveal/Fade';

import card from './card.png';
import cardSecond from './cardSecond.png';
import cardThird from './cardThird.png';
import topImage from './topImage.jpg';
import topImage2 from './topImage2.png';

const Explanation = () => {
  return (
    <>
    <div className="grid grid-cols-3 border-b border-neutral-900">
    </div>
    <div className="grid grid-cols-2 sm:grid-cols-4 mt-20 pb-10 bg-neutral-50 drop-shadow-2xl">
      <div className="col-span-2 sm:col-span-4">
        <div className="m-2 my-4 text-neutral border-b border-neutral-700 text-4xl ">使い方</div>
      </div>
      <div className="col-span-2 mx-2 mt-10 drop-shadow-2xl border border-neutral-500">
      <img src={topImage} alt="topImage" className="w-full"/>
      </div>
      <div className="col-span-2 mt-10 text-neutral text-xl xl:text-3xl mb-5 mx-3">
      <Fade bottom cascade> 
        <div className="border-b border-neutral-700">アカウント作成</div>
        <br></br>
        アカウントを作成することでサービスの利用が可能になります。
        <br></br>
        お試しにはゲストログインをご利用ください。
      </Fade>
      </div>
      <div className="col-span-2 mt-10 text-neutral text-xl xl:text-3xl mb-5 mx-3">
      <Fade bottom cascade> 
        <div className="border-b border-neutral-700">プロット作成</div>
        <br></br>
        流れに沿って進めるだけで本格的なストーリープロットを作成することができます。
        <br></br>
        
      </Fade>
      </div>
      <div className="col-span-2 mt-10 mx-2 drop-shadow-2xl border border-neutral-500">
        <img src={topImage2} alt="topImage2" className="w-full"/>
      </div>
      <Fade bottom cascade>
      <div className="col-span-2 mt-10 mx-2 drop-shadow-2xl border border-neutral-500">
        <div className="carousel w-full ">
          <div id="slide1" className="carousel-item relative w-full">
            <img src={card} alt="card" className="w-full"/>
            <div className="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
              <a href="#slid3" className="btn btn-circle  btn-sm">❮</a> 
              <a href="#slide2" className="btn btn-circle  btn-sm">❯</a>
            </div>
          </div> 
          <div id="slide2" className="carousel-item relative w-full">
          <img src={cardSecond} alt="card" className="w-full"/>
            <div className="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
              <a href="#slide1" className="btn btn-circle  btn-sm">❮</a> 
              <a href="#slide3" className="btn btn-circle  btn-sm">❯</a>
            </div>
          </div> 
          <div id="slide3" className="carousel-item relative w-full">
          <img src={cardThird} alt="card" className="w-full"/>
            <div className="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
              <a href="#slide2" className="btn btn-circle  btn-sm">❮</a> 
              <a href="#slide1" className="btn btn-circle  btn-sm">❯</a>
            </div>
          </div> 
        </div> 
      </div>
      </Fade>
      <div className="col-span-2 mt-10 text-neutral text-xl xl:text-3xl my-5 mx-3">
      <Fade bottom cascade>
        <div className="border-b border-neutral-700">カードタブ</div>
        <br></br>
        グラフとカードを使用した視覚的にわかりやすいプロット管理が可能に。
        <br></br>
        トグルを利用することで、画面上に表示したいものを自由に選択できます。
        </Fade>
      </div>
      <div className="col-span-2 mt-20 text-neutral text-xl xl:text-3xl my-5 mx-3">
        <a href="https://midplot.com/demos/plots" rel="noopener noreferrer">
          <button className="btn btn-wide animate-pulsate-fwd">デモを体験してみる</button>
        </a>
      </div>
      <div className="col-span-2 mt-20 text-neutral text-xl xl:text-3xl my-5 mx-3">
        <a href="https://midplot.com/users/new" rel="noopener noreferrer">
          <button className="btn btn-wide animate-pulsate-fwd">アカウトを作成する</button>
        </a>
      </div>
      <div className="col-span-2 mt-10 mx-2 drop-shadow-2xl">
      </div>
    </div>
    </>
  );
};

export default Explanation;