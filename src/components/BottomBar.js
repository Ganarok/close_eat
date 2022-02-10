import React, { PureComponent } from 'react'
import { StyleSheet, Text, View } from 'react-native'

import { deviceWidth } from '../utils/stylesConfig'


class BottomBar extends PureComponent {

    render() {
        return (
            <View styles={styles.Bar}>
                <Text>Bar</Text>
            </View>
        )
    }
}

const styles = StyleSheet.create({
    Bar: {
        display: 'flex',
        justifyContent: 'space-between',
        height: 40,
        width: deviceWidth,
        backgroundColor: 'black',
    }
})

export default BottomBar