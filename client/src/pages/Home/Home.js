import React, { useContext, useEffect } from 'react';
import HomeBG from "../../assets/home.jpg";
import styled from "styled-components";
import { GlobalContext } from '../../utils/Context';
import { PageContainer } from '../../components/GlobalStyles/PageStyles';
import SearchBox from '../../components/SearchBox/SearchBox';

const HomeContainer = styled.div`
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-image: url(${HomeBG});
    background-position: center;
    background-size: cover;
    background-repeat: no-repeat;
    height: 100vh;
    border-radius: 0 0 40px 40px;
    padding: 20px;
`;

const Heading = styled.h1`
    font-size: 2.5rem;
    color: #000; /* Black text color */
    text-align: center;
    margin-bottom: 30px;
`;

const SmallText = styled.p`
    font-size: 1rem;
    color: #000; /* Black text color */
    text-align: center;
`;

const Home = () => {
    const { setPage } = useContext(GlobalContext);

    useEffect(() => {
        setPage("Home");
    }, []);

    return (
        <PageContainer>
            <HomeContainer>
                <Heading>Welcome to StayEase!</Heading>
                <Heading>Hotel Bookings Made Easy</Heading>
                <SearchBox styles={{
                    background: 'rgba(255, 255, 255, 0.8)',
                    padding: '20px',
                    borderRadius: '10px'
                }} />
                <SmallText>
                    Admin ID: admin2023@gmail.com<br />
                    Admin password: 1234
                </SmallText>
            </HomeContainer>
        </PageContainer>
    );
};

export default Home;
