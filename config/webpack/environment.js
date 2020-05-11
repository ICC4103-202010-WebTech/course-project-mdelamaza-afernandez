//#const { environment } = require('@rails/webpacker')

//module.exports = environment
<<<<<<< HEAD

=======
>>>>>>> f8011012dd746b13d334e70351ac07d8020e222c

const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({

    $: 'jquery',

    jQuery: 'jquery',

    Popper: ['popper.js', 'default']

}))

module.exports = environment