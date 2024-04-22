import React, { useState, useRef } from 'react'
import { FormButton, Input } from '../GlobalStyles/FormStyles'
import styled from 'styled-components'
import ReactCrop from 'react-image-crop';
import 'react-image-crop/dist/ReactCrop.css';
import { ModalBox, ModalContainer } from '../GlobalStyles/ModalStyles';
import { ButtonsContainer } from '../../pages/Auth/ModuleStyles';
import BlankImg from "../../assets/hotel.png"
import DeleteOutlineIcon from '@mui/icons-material/DeleteOutline';

const UploadContainer = styled.div`
    margin-bottom: 20px;
    background: #e2e2e2;
    border-radius: 4px;
    overflow: hidden;
`

const ImageContainer = styled.div`
    overflow: hidden;
    cursor: pointer;
    height: 260px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    &.selected{
        border: 2px red solid
    }
    img{
        max-width: 100%;
        max-height: 100%;
    }
    .delete-icon{
        position: absolute;
        bottom: 2px;
        right: 2px;
        background: white;
        padding: 2px;
        border-radius: 4px
    }
`

const ImageUpload = (props) => {

    const { setImageURL, imageUrl, data, styles, setSelected, selected } = props
    const fileInput = useRef(null)

    const [src, setSrc] = useState(imageUrl ? imageUrl : BlankImg);

    const displayChange = e => {
        e.preventDefault();
        setSrc(URL.createObjectURL(e.target.files[0]));
    }

    const selectForDelete = () => {
        if (selected.includes(data.uuid)) {
            let sl = selected.filter(s => s !== data.uuid)
            setSelected(sl)
        }
        else {
            setSelected([...selected, data.uuid])
        }
    }

    return (
        <UploadContainer>
            {props.single ? (
                <ImageContainer onClick={() => !imageUrl ? fileInput.current.click() : null} style={styles}>
                    <img src={src} alt="" />
                </ImageContainer>
            ) : (
                <ImageContainer onClick={() => !imageUrl ? fileInput.current.click() : null} style={styles}
                    className={`${selected.includes(data.uuid) ? 'selected' : ''}`}>
                    <img src={src} alt="" />
                    {imageUrl && <DeleteOutlineIcon className="delete-icon" onClick={selectForDelete} />}
                </ImageContainer>
            )}

            <Input type="file" accept="image/*" onChange={(e) => displayChange(e)}
                style={{ display: 'none' }}
                ref={fileInput}>
            </Input>
        </UploadContainer>
    )
}

export default ImageUpload
