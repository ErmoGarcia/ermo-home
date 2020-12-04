import React from 'react';
import services from './services.json';

function Services() {
    console.log(services);

    // const [services, setServices] = useState([]);
    //
    // useEffect(() => {
    //     fetch("http://127.0.0.1:8000")
    //     .then(response => {
    //         console.log(response);
    //         return response.json();
    //     }).then(data => setServices(data));
    // })

    return (

        <div className="services-list">{
            [...services].map((service, index) =>
                <ServiceItem
                    key={index}
                    url={service.url}
                    name={service.name}
                    logo={service.logo}
                    description={service.description}
                />
            )
        }</div>

    )
}


            function ServiceItem(props) {
                    return (
                        <a href={"https://"+props.url}>
                            <div className="service-logo">
                                <img alt={props.name} src={props.logo}/>
                            </div>
                            <div className="service-content">
                                <h2>{props.name}</h2>
                                <p>{props.description}</p>
                            </div>
                        </a>
    )
}

export default Services;
