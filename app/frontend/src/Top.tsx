import React, { useEffect, useRef } from 'react';
import Fade from 'react-reveal/Fade';

function Top() {
  return (
    <>
    <div className="relative">
      <div className="my-text-second hidden absolute bottom-2 text-neutral-content transition duration-1000 text-3xl sm:text-5xl md:text-7xl lg:text-8xl xl:text-8xl 2xl:text-8xl backdrop-brightness-50"><Fade right cascade>さあ、<br></br>MidPlotで<br></br>物語を作ろう。</Fade></div>
    </div>
    </>
  );
}
export default Top;
