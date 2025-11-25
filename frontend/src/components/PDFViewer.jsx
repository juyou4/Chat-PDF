import React, { useState } from 'react';
import { Document, Page, pdfjs } from 'react-pdf';
import { ChevronLeft, ChevronRight, ZoomIn, ZoomOut } from 'lucide-react';
import 'react-pdf/dist/esm/Page/AnnotationLayer.css';
import 'react-pdf/dist/esm/Page/TextLayer.css';

// Configure worker
pdfjs.GlobalWorkerOptions.workerSrc = `//cdnjs.cloudflare.com/ajax/libs/pdf.js/${pdfjs.version}/pdf.worker.min.js`;

const PDFViewer = ({ pdfUrl, onTextSelect }) => {
    const [numPages, setNumPages] = useState(null);
    const [pageNumber, setPageNumber] = useState(1);
    const [scale, setScale] = useState(1.0);
    const [selectedText, setSelectedText] = useState('');

    function onDocumentLoadSuccess({ numPages }) {
        setNumPages(numPages);
    }

    const handleTextSelection = () => {
        const selection = window.getSelection();
        const text = selection.toString().trim();
        if (text) {
            setSelectedText(text);
            if (onTextSelect) {
                onTextSelect(text);
            }
        }
    };

    const changePage = (offset) => {
        setPageNumber(prevPageNumber => Math.max(1, Math.min(prevPageNumber + offset, numPages || 1)));
    };

    const zoomIn = () => setScale(prev => Math.min(prev + 0.2, 3.0));
    const zoomOut = () => setScale(prev => Math.max(prev - 0.2, 0.5));

    return (
        <div className="h-full flex flex-col bg-gray-50 rounded-2xl overflow-hidden">
            <div className="flex items-center justify-between p-4 bg-white border-b border-gray-200">
                <div className="flex items-center gap-2">
                    <button onClick={() => changePage(-1)} disabled={pageNumber <= 1} className="p-2 rounded-lg hover:bg-gray-100 disabled:opacity-50">
                        <ChevronLeft className="w-5 h-5" />
                    </button>
                    <span className="text-sm font-medium px-3">{pageNumber} / {numPages || '--'}</span>
                    <button onClick={() => changePage(1)} disabled={pageNumber >= (numPages || 1)} className="p-2 rounded-lg hover:bg-gray-100 disabled:opacity-50">
                        <ChevronRight className="w-5 h-5" />
                    </button>
                </div>
                <div className="flex items-center gap-2">
                    <button onClick={zoomOut} className="p-2 rounded-lg hover:bg-gray-100">
                        <ZoomOut className="w-5 h-5" />
                    </button>
                    <span className="text-sm font-medium px-2">{Math.round(scale * 100)}%</span>
                    <button onClick={zoomIn} className="p-2 rounded-lg hover:bg-gray-100">
                        <ZoomIn className="w-5 h-5" />
                    </button>
                </div>
            </div>
            <div className="flex-1 overflow-auto p-6 flex items-start justify-center bg-gray-50" onMouseUp={handleTextSelection}>
                <Document file={pdfUrl} onLoadSuccess={onDocumentLoadSuccess}>
                    <Page pageNumber={pageNumber} scale={scale} renderTextLayer={true} renderAnnotationLayer={true} />
                </Document>
            </div>
            {selectedText && (
                <div className="p-3 bg-blue-50 border-t border-blue-100">
                    <div className="text-xs text-blue-600 font-medium">已选择文本</div>
                    <div className="text-sm text-gray-700 mt-1 line-clamp-2">{selectedText}</div>
                </div>
            )}
        </div>
    );
};

export default PDFViewer;
