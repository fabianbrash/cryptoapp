import { configureStore } from "@reduxjs/toolkit";
import {cryptoApi} from '../services/crptoApi';

export default configureStore({
    reducer: {
        [cryptoApi.reducerPath]: cryptoApi.reducer,
    },
});