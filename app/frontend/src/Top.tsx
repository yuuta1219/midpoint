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
  const myElement8 = useRef(null);
  const myElement9 = useRef(null);
  const myElement10 = useRef(null);
  const myElement11 = useRef(null);
  const myElement12 = useRef(null);
  const myElement13 = useRef(null);
  const myElement14 = useRef(null);
  const myElement15 = useRef(null);
  const myElement16 = useRef(null);



  useEffect(() => {
    gsap.from(myElement1.current, {
      duration: 0.1,
      text: '            ',
      onComplete: () => {
        gsap.to(myElement1.current, {
          duration: 0.1,
          text: 'M',
        });
      },
    });

    gsap.from(myElement2.current, {
      duration: 0.2,
      text: '',
      onComplete: () => {
        gsap.to(myElement2.current, {
          duration: 0.5,
          text: 'OMENTUM ',
        });
      },
    });

    gsap.from(myElement3.current, {
      duration: 0.8,
      text: '',
      onComplete: () => {
        gsap.to(myElement3.current, {
          duration: 0.1,
          text: 'I',
        });
      },
    });

    gsap.from(myElement4.current, {
      duration: 0.9,
      text: '',
      onComplete: () => {
        gsap.to(myElement4.current, {
          duration: 0.5,
          text: 'NCREASES',
        });
      },
    });

    gsap.from(myElement5.current, {
      duration: 1.5,
      text: '',
      onComplete: () => {
        gsap.to(myElement5.current, {
          duration: 0.1,
          text: 'D',
        });
      },
    });

    gsap.from(myElement6.current, {
      duration: 1.6,
      text: '',
      onComplete: () => {
        gsap.to(myElement6.current, {
          duration: 0.5,
          text: 'RAMATIC',
        });
      },
    });

    gsap.from(myElement7.current, {
      duration: 2.2,
      text: '',
      onComplete: () => {
        gsap.to(myElement7.current, {
          duration: 0.1,
          text: 'P',
        });
      },
    });
    gsap.from(myElement8.current, {
      duration: 2.3,
      text: '',
      onComplete: () => {
        gsap.to(myElement8.current, {
          duration: 0.5,
          text: 'ROGRESSION',
        });
      },
    });

    gsap.from(myElement9.current, {
      duration: 2.9,
      text: '',
      onComplete: () => {
        gsap.to(myElement9.current, {
          duration: 0.1,
          text: 'O',
        });
      },
    });

    gsap.from(myElement10.current, {
      duration: 3,
      text: '',
      onComplete: () => {
        gsap.to(myElement10.current, {
          duration: 0.1,
          text: 'F',
        });
      },
    });

    gsap.from(myElement11.current, {
      duration: 3.1,
      text: '',
      onComplete: () => {
        gsap.to(myElement11.current, {
          duration: 0.1,
          text: 'I',
        });
      },
    });

    gsap.from(myElement12.current, {
      duration: 3.2,
      text: '',
      onComplete: () => {
        gsap.to(myElement12.current, {
          duration: 0.5,
          text: 'NTRIGUING',
        });
      },
    });

    gsap.from(myElement13.current, {
      duration: 3.8,
      text: '',
      onComplete: () => {
        gsap.to(myElement13.current, {
          duration: 0.1,
          text: 'N',
        });
      },
    });

    gsap.from(myElement14.current, {
      duration: 3.9,
      text: '',
      onComplete: () => {
        gsap.to(myElement14.current, {
          duration: 0.5,
          text: 'ARRATIVES',
        });
      },
    });

    gsap.from(myElement15.current, {
      duration: 4.5,
      text: '',
      onComplete: () => {
        gsap.to(myElement15.current, {
          duration: 0.1,
          text: 'T',
        });
      },
    });
    gsap.from(myElement16.current, {
      duration: 4.6,
      text: '',
      onComplete: () => {
        gsap.to(myElement16.current, {
          duration: 0.5,
          text: 'HROUGH',
        });
      },
    });

  }, []);

  return (
    <>
      <div className="flex backdrop-brightness-50 pr-3"><div ref={myElement1} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div><div className="text-hide" ref={myElement2} style={{ whiteSpace: 'pre' }}></div></div>
      <div className="flex backdrop-brightness-50"><div ref={myElement3} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div><div className="text-hide" ref={myElement4} style={{ whiteSpace: 'pre' }}></div></div>
      <div className="flex backdrop-brightness-50"><div ref={myElement5} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div><div className="text-hide" ref={myElement6} style={{ whiteSpace: 'pre' }}></div></div>
      <div className="flex backdrop-brightness-50"><div ref={myElement7} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div><div className="text-hide" ref={myElement8} style={{ whiteSpace: 'pre' }}></div></div>
      <div className="flex backdrop-brightness-50"><div ref={myElement9} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div><div className="text-hide" ref={myElement10} style={{ whiteSpace: 'pre' }}></div></div>
      <div className="flex backdrop-brightness-50"><div ref={myElement11} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div><div className="text-hide" ref={myElement12} style={{ whiteSpace: 'pre' }}></div></div>
      <div className="flex backdrop-brightness-50"><div ref={myElement13} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div><div className="text-hide" ref={myElement14} style={{ whiteSpace: 'pre' }}></div></div>
      <div className="flex backdrop-brightness-50"><div ref={myElement15} style={{ whiteSpace: 'pre' }} className="my-text transition duration-1000"></div><div className="text-hide" ref={myElement16} style={{ whiteSpace: 'pre' }}></div></div>
    </>
  );
}
export default Top;
