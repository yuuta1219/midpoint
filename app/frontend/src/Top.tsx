import React, { useEffect, useRef } from 'react';
import { gsap } from 'gsap';
import { TextPlugin } from 'gsap/TextPlugin';
import Fade from 'react-reveal/Fade';

gsap.registerPlugin(TextPlugin);

function Top() {
  const myElement1 = useRef(null);
  const myElement2 = useRef(null);
  const myElement3 = useRef(null);
  const myElement4 = useRef(null);
  const myElement5 = useRef(null);
  const myElement6 = useRef(null);
  const myElement7 = useRef(null);
  const myElement8 = useRef(null);

  useEffect(() => {
    gsap.from(myElement1.current, {
      duration: 0.1,
      text: '            ',
      onComplete: () => {
        gsap.to(myElement1.current, {
          duration: 1,
          text: '船は、氷山に衝突した。',
        });
      },
    });

    gsap.from(myElement2.current, {
      duration: 1.5,
      text: '',
      onComplete: () => {
        gsap.to(myElement2.current, {
          duration: 1,
          text: '彼には、死者の声が聞こえた。',
        });
      },
    });

    gsap.from(myElement3.current, {
      duration: 3,
      text: '',
      onComplete: () => {
        gsap.to(myElement3.current, {
          duration: 1,
          text: 'この地は、地球であるとを悟った。',
        });
      },
    });

    gsap.from(myElement4.current, {
      duration: 4.5,
      text: '',
      onComplete: () => {
        gsap.to(myElement4.current, {
          duration: 1,
          text: 'ヒーロー達は、見せかけの勝利を収めた。',
        });
      },
    });

    gsap.from(myElement5.current, {
      duration: 6,
      text: '',
      onComplete: () => {
        gsap.to(myElement5.current, {
          duration: 1,
          text: '刑務所の中では、レコードの音楽が響き渡った。',
        });
      },
    });

    gsap.from(myElement6.current, {
      duration: 7.5,
      text: '',
      onComplete: () => {
        gsap.to(myElement6.current, {
          duration: 1,
          text: '絆を深めた二人は、人間の操作する重機に襲われた。',
        });
      },
    });

    gsap.from(myElement7.current, {
      duration: 9,
      text: '',
      onComplete: () => {
        gsap.to(myElement7.current, {
          duration: 1,
          text: 'これらはミッドポイントに起きた出来事だ。',
        });
      },
    });

    gsap.from(myElement8.current, {
      duration: 11,
      text: '',
      onComplete: () => {
        gsap.to(myElement8.current, {
          duration: 1,
          text: 'ミッドポイントは作品を変える力を持っている。',
        });
      },
    });

  }, []);

  return (
    <>
    <div className="relative">
      <div className="z-10 ml-2 text-md sm:text-xl md:text-2xl lg:text-3xl xl:text-4xl 2xl:text-5xl absolute bottom-2">
        <div ref={myElement1} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000 backdrop-brightness-50 pr-3"></div>
        <div ref={myElement2} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000 backdrop-brightness-50"></div>
        <div ref={myElement3} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000 backdrop-brightness-50"></div>
        <div ref={myElement4} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000 backdrop-brightness-50"></div>
        <div ref={myElement5} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000 backdrop-brightness-50"></div>  
        <div ref={myElement6} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000 backdrop-brightness-50"></div>  
        <div ref={myElement7} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000 backdrop-brightness-50"></div>  
        <div ref={myElement8} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000 backdrop-brightness-50"></div>  
      </div>
      <div className="my-text-second hidden absolute bottom-2 text-neutral-content transition duration-1000 text-3xl sm:text-5xl md:text-7xl lg:text-8xl xl:text-8xl 2xl:text-8xl backdrop-brightness-50"><Fade right cascade>さあ、<br></br>Midpointで<br></br>物語を作ろう。</Fade></div>
    </div>
    </>
  );
}
export default Top;
