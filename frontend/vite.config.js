import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path'

export default defineConfig({
    plugins: [react()],
    server: {
        port: 3000,
        proxy: {
            '/api': {
                target: 'http://localhost:8000',
                changeOrigin: true,
                rewrite: (path) => path.replace(/^\/api/, '')
            },
            // Proxy for direct backend calls if frontend uses full URL sometimes
            '/upload': 'http://localhost:8000',
            '/chat': 'http://localhost:8000',
            '/models': 'http://localhost:8000',
            '/health': 'http://localhost:8000'
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
})
