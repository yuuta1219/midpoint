import React, { useEffect, useRef } from 'react';
import { gsap } from 'gsap';
import { TextPlugin } from 'gsap/TextPlugin';

gsap.registerPlugin(TextPlugin);

function Top() {
  const myElement1 = useRef(null);
  const myElement2 = useRef(null);
  const myElement3 = useRef(null);
  const myElement4 = useRef(null);
  const myElement5 = useRef(null);
  const myElement6 = useRef(null);
  const myElement7 = useRef(null);

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
          text: '彼らは、見せかけの勝利を収めた。',
        });
      },
    });

    gsap.from(myElement3.current, {
      duration: 3,
      text: '',
      onComplete: () => {
        gsap.to(myElement3.current, {
          duration: 1,
          text: '刑務所を、レコードの音色が包んだ。',
        });
      },
    });

    gsap.from(myElement4.current, {
      duration: 4.5,
      text: '',
      onComplete: () => {
        gsap.to(myElement4.current, {
          duration: 1,
          text: '彼は、死者の声が聞こえた。',
        });
      },
    });

    gsap.from(myElement5.current, {
      duration: 6,
      text: '',
      onComplete: () => {
        gsap.to(myElement5.current, {
          duration: 1,
          text: '二人は、重機に襲われた。',
        });
      },
    });

    gsap.from(myElement6.current, {
      duration: 7.5,
      text: '',
      onComplete: () => {
        gsap.to(myElement6.current, {
          duration: 1,
          text: 'その時、地球だと知った。',
        });
      },
    });

    gsap.from(myElement7.current, {
      duration: 9,
      text: '',
      onComplete: () => {
        gsap.to(myElement7.current, {
          duration: 1,
          text: 'ミッドポイントは、作品を変えてしまう力を持っている。',
        });
      },
    });

  }, []);

  return (
    <>
    <div ref={myElement1} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000 pr-3"></div>
    <div ref={myElement2} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div>
    <div ref={myElement3} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div>
    <div ref={myElement4} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div>
    <div ref={myElement5} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div>  
    <div ref={myElement6} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div>  
    <div ref={myElement7} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div>  
    </>
  );
}
export default Top;
