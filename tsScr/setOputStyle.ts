type StyleOptions = {
  color?: 'black' | 'red' | 'green' | 'yellow' | 'blue' | 'magenta' | 'cyan' | 'white',
  bgColor?: 'black' | 'red' | 'green' | 'yellow' | 'blue' | 'magenta' | 'cyan' | 'white',
  bold?: boolean // 默認值將會是 true
};


// 設定 console.log 的輸出樣式
// // 使用範例
// const oput = setStyle({ color: 'red', bgColor: 'yellow' });
// console.log(oput('這是測試字串'));

// const oputDefaultBold = setStyle();
// console.log(oputDefaultBold('這是粗體預設字串')); // 默認顯示粗體

export function setOputStyle(options: StyleOptions = {}) {
  return function (text: string): string {
    const colors: { [key: string]: string } = {
      black: '30',
      red: '31',
      green: '32',
      yellow: '33',
      blue: '34',
      magenta: '35',
      cyan: '36',
      white: '37'
    };

    const backgroundColors: { [key: string]: string } = {
      black: '40',
      red: '41',
      green: '42',
      yellow: '43',
      blue: '44',
      magenta: '45',
      cyan: '46',
      white: '47'
    };

    let styleStart = '\x1b[';

    // 設定文字顏色 (如果沒有提供，則不改變終端機預設文字顏色)
    if (options.color && colors[options.color]) {
      styleStart += `${colors[options.color]}m`;
    }

    // 設定背景顏色 (如果沒有提供，則不改變終端機預設背景顏色)
    if (options.bgColor && backgroundColors[options.bgColor]) {
      styleStart += `\x1b[${backgroundColors[options.bgColor]}m`;
    }

    // 設定粗體 (默認為 true)
    if (options.bold !== false) {
      styleStart += `\x1b[1m`;
    }

    const styleEnd = '\x1b[0m'; // 重置樣式

    return `${styleStart}${text}${styleEnd}`;
  };
}

