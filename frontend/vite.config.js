import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';

export default defineConfig({
    plugins: [react()],
    server: {
        port: 3000,
        proxy: {
            '/upload': {
                target: 'http://localhost:8000',
                changeOrigin: true
            },
            '/document': {
                target: 'http://localhost:8000',
                changeOrigin: true
            },
            '/models': {
                target: 'http://localhost:8000',
                changeOrigin: true
            },
            '/health': {
                target: 'http://localhost:8000',
                changeOrigin: true
            }
        }
    },
    resolve: {
        alias: {
            '@': path.resolve(__dirname, './src')
        }
    },
    build: {
        outDir: 'build',
        sourcemap: true
    }
});
