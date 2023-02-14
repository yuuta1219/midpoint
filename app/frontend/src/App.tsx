import Split from "react-split";

const menuItems = [
  { label: "メニュー1", url: "#1" },
  { label: "メニュー2", url: "#2" },
  { label: "メニュー3", url: "#3" },
  { label: "メニュー4", url: "#4" }
];

export default function App() {
  return (
    <Split
      className="flex"
      // ガターエレメントのカスタマイズ
      gutter={(_, direction) => {
        const gutterElement = document.createElement("div");
        gutterElement.className = `w-[3px] bg-indigo-500 hover:cursor-col-resize hover:w-4 hover:bg-indigo-700 transition-all delay-300 duration-300 ease-in-out`;
        return gutterElement;
      }}
      // デフォルトのガター幅を無効にするために指定
      gutterStyle={() => ({})}
      sizes={[25, 75]}
    >
      {/** 一つ目のコンポーネント */}
      <ul className="bg-stone-50 p-2">
        {menuItems.map((item) => (
          <li key={item.url}>
            <a href={item.url}>{item.label}</a>
          </li>
        ))}
      </ul>
      {/** 二つ目のコンポーネント */}
      <div className="bg-indigo-50 flex items-center justify-center">
        コンテンツ
      </div>
    </Split>
  );
}
