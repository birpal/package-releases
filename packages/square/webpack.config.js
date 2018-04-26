const path = require('path');
const pkg = require('./package.json');

module.exports = {
  entry: './src/index.js',
  resolve: {
    extensions: ['.js', '.jsx'],
  },
  output: {
    library: pkg.name,
    libraryTarget: 'commonjs2',
    path: path.resolve(__dirname, './', 'dist'),
    filename: 'index.js',
    auxiliaryComment: `${pkg.version}`,
  },
  module: {
    rules: [
      {
        test: /\.jsx$/,
        use: { loader: 'babel-loader' },
      },
      {
        test: /\.scss$/,
        use: [
          { loader: 'style-loader' },
          { loader: 'css-loader', options: { modules: true } },
          { loader: 'sass-loader' },
        ],
      },
    ],

  },
};
