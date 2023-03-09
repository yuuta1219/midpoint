import React from 'react'

import pushpin from './pushpins.png';

const Explanation = () => {
  return (
    <div className="grid grid-cols-3">
      <div className="m-10 col-span-1 shadow-xl bg-white text-neutral">
        <img src={pushpin} alt="pin icon" className="mx-auto" width="30px" height="30px" />

        <div>ああああああああああ</div>
      </div>
    </div>
  );
};

export default Explanation;
