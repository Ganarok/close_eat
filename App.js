import { createBottomTabNavigator } from '@react-navigation/bottom-tabs'
import React, { PureComponent } from 'react'

import Welcome from './src/components/Welcome'
import { NavigationContainer } from '@react-navigation/native'

const Tab = createBottomTabNavigator()

class App extends PureComponent {

    render() {
        return (
            <NavigationContainer>
                <Tab.Navigator>
                    <Tab.Screen name='Welcome' component={Welcome}/>
                </Tab.Navigator>
            </NavigationContainer> 
        )
    }
}

export default App
